import React from 'react';
import { render, screen } from '@testing-library/react';
import TopBar from '../../components/TopBar';

describe('TopBar Component', () => {
  test('renders TopBar component', () => {
    render(<TopBar />);
    // Basic rendering test
    expect(document.body).toBeTruthy();
  });
});

